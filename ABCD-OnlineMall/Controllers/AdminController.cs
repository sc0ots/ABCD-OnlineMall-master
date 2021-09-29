using ABCD_OnlineMall.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.Authorization;
namespace ABCD_OnlineMall.Controllers
{
    public class AdminController : Controller
    {
        private readonly mallDBContext _context;



        public AdminController(mallDBContext context)
        {
            _context = context;

        }
        public IActionResult Index()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            var admin = _context.Admins.ToList();
            return View(admin);
        }
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string Password)
        {
            Admin emp = _context.Admins.SingleOrDefault(e => e.AdminName.Equals(username));

            if (emp != null)
            {

                if (emp.AdminPassword.Equals(Password))
                {
                    HttpContext.Session.SetString("name", emp.AdminName);

                    return RedirectToAction("IndexAdmin", "Plots");
                }
                else
                {
                    ViewBag.mess = "Invalid password";

                }
            }
            else
            {
                ModelState.AddModelError("", "Username");
            }
            return View();
        }
        [Route("logout")]
        [HttpGet]
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("name");
            return RedirectToAction("Login");
        }
        public async Task<IActionResult> Details(int? id)
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (id == null)
            {
                return NotFound();
            }

            var admin = await _context.Admins.FirstOrDefaultAsync(a => a.AdminId == id);
            if (admin == null)
            {
                return NotFound();
            }

            return View(admin);
        }
        public IActionResult Create()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }

        // POST: Brands/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AdminId,AdminName,AdminPassword")] Admin admin)
        {
            if (ModelState.IsValid)
            {
                _context.Add(admin);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(admin);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Delete(int id)
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            var admin = await _context.Admins.FindAsync(id);
            _context.Admins.Remove(admin);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

    }
}
