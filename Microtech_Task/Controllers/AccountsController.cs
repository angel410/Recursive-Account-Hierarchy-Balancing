using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microtech_Task.Models;

namespace Microtech_Task.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AccountsController( AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("top-level-accounts")]
        public async Task<IActionResult> GetTopLevelAccounts()
        {
            var result = await GetTopLevelAccountsAsync();
            return Ok(result);
        }
        private async Task<Dictionary<int, decimal>> GetTopLevelAccountsAsync()
        {
            var topLevelAccounts = await _context.Accounts
                .Where(a => a.Acc_parent == null)
                .ToListAsync();

            var result = new Dictionary<int, decimal>();

            foreach (var account in topLevelAccounts)
            {
                result.Add(account.Acc_number, GetTotalBalance(account.Acc_number));
            }

            return result;
        }

        private decimal GetTotalBalance(int accNumber)
        {
            var account = _context.Accounts
                .Include(a => a.Children)
                .FirstOrDefault(a => a.Acc_number == accNumber);

            if (account == null)
            {
                return 0;
            }

            var balance = account.Balance ?? 0;

            return balance + account.Children.Sum(child => GetTotalBalance(child.Acc_number));
        }

        [HttpGet("account-details/{accNumber}")]
        public async Task<IActionResult> GetAccountDetails(int accNumber)
        {
            var account = await _context.Accounts
                .Include(a => a.Children)
                    .ThenInclude(c => c.Children) 
                .FirstOrDefaultAsync(a => a.Acc_number == accNumber);

            if (account == null)
                return NotFound();

            var details = GetAccountDetailsRecursive(account, string.Empty);

           
            return Ok(details);
        }



        private List<string> GetAccountDetailsRecursive(Account account, string path)
        {
            var result = new List<string>();

            if (account == null)
            {
                return result;
            }

            var currentPath = string.IsNullOrEmpty(path) ? account.Acc_number.ToString("D2") : $"{path}-{account.Acc_number:D2}";


            if (account.Children == null || !account.Children.Any())
            {
                var balance = account.Balance ?? 0;
                result.Add($"Account {currentPath} = {balance:F0}");
            }
            else
            {
                foreach (var child in account.Children)
                {
                    result.AddRange(GetAccountDetailsRecursive(child, currentPath));
                }
            }

            return result;
        }








    }

}
