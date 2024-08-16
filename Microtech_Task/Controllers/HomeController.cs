using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microtech_Task.Models;

namespace Microtech_Task.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            
            return View();
        }
    }
}
