using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ABCD_OnlineMall.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace ABCD_OnlineMall.Controllers
{
    public class CinemasController : Controller
    {
        private readonly mallDBContext _context;
        private readonly IWebHostEnvironment environment;
        public CinemasController(mallDBContext context, IWebHostEnvironment hostEnvironment)
        {
            _context = context;
            environment = hostEnvironment;
        }

        // GET: Cinemas
        public async Task<IActionResult> Index()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            var mallDBContext = _context.Cinemas.Include(c => c.Movie);
            return View(await mallDBContext.ToListAsync());
        }
        public async Task<IActionResult> IndexSeatReserve()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            var mallDBContext = _context.Seatreserves;
            return View(await mallDBContext.ToListAsync());
        }

        public IActionResult IndexChart()
        {
            string json = HttpContext.Session.GetString("name");
            if (json == null)
            {
                return RedirectToAction("Login", "Admin");
            }
            var cinem1 = _context.Cinemas.Where(m => m.CinemaId == 1).FirstOrDefault();
            var cinem2 = _context.Cinemas.Where(m => m.CinemaId == 2).FirstOrDefault();
            var cinem3 = _context.Cinemas.Where(m => m.CinemaId == 3).FirstOrDefault();
            var cinem4 = _context.Cinemas.Where(m => m.CinemaId == 4).FirstOrDefault();
            var cinem5 = _context.Cinemas.Where(m => m.CinemaId == 5).FirstOrDefault();
            var cinem6 = _context.Cinemas.Where(m => m.CinemaId == 6).FirstOrDefault();
            var movie1 = _context.Movies.Where(m => m.CinemaId == 1).FirstOrDefault();
            var movie2 = _context.Movies.Where(m => m.CinemaId == 2).FirstOrDefault();
            var movie3 = _context.Movies.Where(m => m.CinemaId == 3).FirstOrDefault();
            var movie4 = _context.Movies.Where(m => m.CinemaId == 4).FirstOrDefault();
            var movie5 = _context.Movies.Where(m => m.CinemaId == 5).FirstOrDefault();
            var movie6 = _context.Movies.Where(m => m.CinemaId == 6).FirstOrDefault();
            var sales1 = _context.Seatreserves.Count(s => s.CinemaId == 1);
            var sales2 = _context.Seatreserves.Count(s => s.CinemaId == 2);
            var sales3 = _context.Seatreserves.Count(s => s.CinemaId == 3);
            var sales4 = _context.Seatreserves.Count(s => s.CinemaId == 4);
            var sales5 = _context.Seatreserves.Count(s => s.CinemaId == 5);
            var sales6 = _context.Seatreserves.Count(s => s.CinemaId == 6);

            if (cinem1.MovieId != null)
            {
                ViewBag.movie1 = movie1.Title;
                ViewBag.sales1 = sales1 * movie1.Price;
            }
            else
            {
                ViewBag.movie1 = "Empty";
                ViewBag.sales1 = 0;
            }
            if (cinem2.MovieId != null)
            {
                ViewBag.movie2 = movie2.Title;
                ViewBag.sales2 = sales2 * movie2.Price;
            }
            else
            {
                ViewBag.movie2 = "Empty";
                ViewBag.sales2 = 0;
            }
            if (cinem3.MovieId != null)
            {
                ViewBag.movie3 = movie3.Title;
                ViewBag.sales3 = sales3 * movie3.Price;
            }
            else
            {
                ViewBag.movie3 = "Empty";
                ViewBag.sales3 = 0;
            }
            if (cinem4.MovieId != null)
            {
                ViewBag.movie4 = movie4.Title;
                ViewBag.sales4 = sales4 * movie4.Price;
            }
            else
            {
                ViewBag.movie4 = "Empty";
                ViewBag.sales4 = 0;
            }
            if (cinem5.MovieId != null)
            {
                ViewBag.movie5 = movie5.Title;
                ViewBag.sales5 = sales5 * movie5.Price;
            }
            else
            {
                ViewBag.movie5 = "Empty";
                ViewBag.sales5 = 0;
            }
            if (cinem6.MovieId != null)
            {
                ViewBag.movie6 = movie6.Title;
                ViewBag.sales6 = sales6 * movie6.Price;
            }
            else
            {
                ViewBag.movie6 = "Empty";
                ViewBag.sales6 = 0;
            }
            //ViewBag.sales2 = sales2 * movie2.Price;
            //ViewBag.sales3 = sales3 * movie3.Price;
            //ViewBag.sales4 = sales4 * movie4.Price;
            //ViewBag.sales5 = sales5 * movie5.Price;
            //ViewBag.sales6 = sales6 * movie6.Price;
            //ViewBag.movie1 = movie1.Title;
            //ViewBag.movie2 = movie2.Title;
            //ViewBag.movie3 = movie3.Title;
            //ViewBag.movie4 = movie4.Title;
            //ViewBag.movie5 = movie5.Title;
            //ViewBag.movie6 = movie6.Title;
            return View();
        }
        public async Task<IActionResult> IndexClient()
        {
            var mallDBContext = _context.Movies;
            return View(await mallDBContext.ToListAsync());
        }
        public async Task<IActionResult> PickSeat(TimeSpan time, int cinema, DateTime date, int price, string title)
        {


            var model = new viewmodel1();
            model.Seat = await _context.Seats.ToListAsync();
            model.Seatre2 = await _context.Seatreserves.Where(s => s.CinemaId == cinema && s.Showtime == time && s.SeatreserveDate == date).ToListAsync();
            int code;
            do
            {
                Random generator = new Random();
                String r = generator.Next(0, 100000).ToString("D5");
                code = int.Parse(r.ToString());

            } while (_context.Seatreserves.Any(c => c.SeatreserveCode == code));
            ViewBag.time = time;
            ViewBag.cinema = cinema;
            ViewBag.date = date;
            ViewBag.price = price;
            ViewBag.code = code;
            ViewBag.title = title;

            return View(model);
        }
        public IActionResult CreateReserve(TimeSpan time, int cinema, DateTime date, int price, int code, int total, string title)
        {

            int cinema2 = int.Parse(cinema.ToString());
            var model = new viewmodel1();
            model.Seat = _context.Seats.ToList();
            model.Seatre2 = _context.Seatreserves.Where(s => s.CinemaId == cinema2 && s.Showtime == time && s.SeatreserveDate == date).ToList();
            ViewBag.time = time;
            ViewBag.cinema = cinema2;
            ViewBag.date = date;
            ViewBag.price = price;
            ViewBag.code = code;
            ViewBag.total = total;
            ViewBag.title = title;
            return View(model);
        }

        // POST: Seatres/CreateSeat

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateReserve(int[] seat, TimeSpan time, int cinema, DateTime date, string name, int price, int code, int total, string title, Seatreserve seatreserve)
        {
            foreach (int? s in seat)
            {
                var newSeatre = new Seatreserve();
                newSeatre.CinemaId = cinema;
                newSeatre.SeatreserveDate = date;
                newSeatre.Showtime = time;
                newSeatre.SeatId = s;
                newSeatre.SeatreserveCode = code;
                newSeatre.SeatreserveName = name;

                _context.Add(newSeatre);
                await _context.SaveChangesAsync();
            }
            TempData["movietitle"] = title;
            TempData["movietitle"] = title;
            TempData["time"] = time.ToString();
            TempData["cinema"] = cinema.ToString();
            TempData["date"] = date.Date.ToString("dd. MM. yyyy");
            TempData["seat"] = seat;
            TempData["name"] = name.ToString();
            TempData["total"] = price * seat.Length;
            TempData["code"] = code;
            return RedirectToAction(nameof(Ticket));

        }
        public IActionResult Ticket()
        {
            ViewBag.movietitle = TempData["movietitle"];
            ViewBag.time = TempData["time"];
            ViewBag.cinema = TempData["cinema"];
            ViewBag.date = TempData["date"];
            ViewBag.seat = TempData["seat"];
            ViewBag.name = TempData["name"];
            ViewBag.total = TempData["total"];
            ViewBag.code = TempData["code"];
            return View();
        }
        // GET: Cinemas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var movie = await _context.Movies
                .Include(m => m.Cinemas)
                .FirstOrDefaultAsync(c => c.MovieId == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }
        public async Task<IActionResult> MovieDetailsAdmin(int? id)
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

            var movie = await _context.Movies
                .Include(m => m.Cinemas)
                .FirstOrDefaultAsync(c => c.MovieId == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }

        // GET: Cinemas/Create
        public IActionResult Create(int? id)
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
            var cinema = _context.Cinemas.Find(id);

            return View(cinema.Movie);
        }

        // POST: Cinemas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(int id, [Bind("MovieId,CinemaId,Title,Director,Cast,Description,Duration,Trailer,ImageName,ImageFile,Price")] Movie movie)
        {

            string fileName = Path.GetFileName(movie.ImageFile.FileName);
            string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
            using (var fileStream = new FileStream(file_path, FileMode.Create))
            {
                await movie.ImageFile.CopyToAsync(fileStream);
            }
            movie.ImageName = "Images/" + fileName;
            movie.CinemaId = id;
            var cinema = await _context.Cinemas.FindAsync(id);
            _context.Add(movie);
            await _context.SaveChangesAsync();
            cinema.MovieId = movie.MovieId;
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));


        }

        // GET: Cinemas/Edit/5
        public async Task<IActionResult> Edit(int? id)
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

            var movie = await _context.Movies.FindAsync(id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }

        // POST: Cinemas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MovieId,CinemaId,Title,Director,Cast,Description,Duration,Trailer,ImageName,ImageFile,Price")] Movie movie)
        {
            if (id != movie.MovieId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (movie.ImageFile != null)
                    {
                        string fileName = Path.GetFileName(movie.ImageFile.FileName);
                        string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
                        using (var fileStream = new FileStream(file_path, FileMode.Create))
                        {
                            await movie.ImageFile.CopyToAsync(fileStream);
                        }
                        movie.ImageName = "Images/" + fileName;
                    }
                    _context.Update(movie);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MovieExists(movie.MovieId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }

            return View(movie);
        }

        // GET: Cinemas/Delete/5
        public async Task<IActionResult> Delete(int? id)
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

            var movie = await _context.Movies
                .Include(c => c.Cinema)
                .FirstOrDefaultAsync(m => m.MovieId == id);
            if (movie == null)
            {
                return NotFound();
            }

            return View(movie);
        }

        // POST: Cinemas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var movie = await _context.Movies.FindAsync(id);
            var cinema = await _context.Cinemas.Where(c => c.MovieId == id).FirstOrDefaultAsync();
            var seatre = await _context.Seatreserves.Where(c => c.Cinema.Movie.MovieId == id).ToListAsync();
            foreach (var item in seatre)
            {
                _context.Seatreserves.Remove(item);
            }
            cinema.Movies.Clear();
            cinema.Seatreserves.Clear();
            string fileName = Path.GetFileName(movie.ImageName);
            string file_path = Path.Combine(Directory.GetCurrentDirectory(), environment.WebRootPath, "Images", fileName);
            if (System.IO.File.Exists(file_path))
            {
                System.IO.File.Delete(file_path);
            }
            _context.Movies.Remove(movie);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CinemaExists(int id)
        {
            return _context.Cinemas.Any(e => e.CinemaId == id);
        }
        private bool MovieExists(int id)
        {
            return _context.Movies.Any(e => e.MovieId == id);
        }
    }
}
