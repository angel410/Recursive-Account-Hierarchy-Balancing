using Microsoft.EntityFrameworkCore;
using Microtech_Task.Models;

var builder = WebApplication.CreateBuilder(args);
var env = builder.Environment;
builder.Logging.ClearProviders();
var configuration = new ConfigurationBuilder()
    .SetBasePath(builder.Environment.ContentRootPath)
    .AddJsonFile("appsettings.json")
    .Build();

builder.Services.AddControllers().AddXmlSerializerFormatters();

builder.Services.AddDbContext<AppDbContext>(options =>
               options.UseSqlServer(
                   configuration.GetConnectionString("DefaultConnection"), o => o.CommandTimeout(180)));

builder.Services.AddScoped<AppDbContext>();

builder.Services.AddHttpContextAccessor();
builder.Services.AddControllersWithViews();
// Add services to the container.
builder.Services.AddRazorPages();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();

    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");

    endpoints.MapRazorPages();
});
app.Run();
