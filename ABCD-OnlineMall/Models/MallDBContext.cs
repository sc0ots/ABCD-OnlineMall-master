using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class mallDBContext : DbContext
    {
        public mallDBContext()
        {
        }

        public mallDBContext(DbContextOptions<mallDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Cinema> Cinemas { get; set; }
        public virtual DbSet<Feedback> Feedbacks { get; set; }
        public virtual DbSet<Movie> Movies { get; set; }
        public virtual DbSet<Plot> Plots { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Seat> Seats { get; set; }
        public virtual DbSet<Seatreserve> Seatreserves { get; set; }
        public virtual DbSet<Store> Stores { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.; Initial Catalog =mallDB; uid=sa;pwd=123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Admin>(entity =>
            {
                entity.ToTable("admins");

                entity.Property(e => e.AdminId).HasColumnName("adminId");

                entity.Property(e => e.AdminName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("adminName");

                entity.Property(e => e.AdminPassword)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("adminPassword");
            });

            modelBuilder.Entity<Brand>(entity =>
            {
                entity.ToTable("brands");

                entity.Property(e => e.BrandId).HasColumnName("brandId");

                entity.Property(e => e.BrandName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("brandName");

                entity.Property(e => e.BrandUrl)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("brandURL");

                entity.Property(e => e.ImageName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("imageName");

                entity.Property(e => e.StoreId).HasColumnName("storeId");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Brands)
                    .HasForeignKey(d => d.StoreId)
                    .HasConstraintName("FK__brands__storeId__2E1BDC42");
            });

            modelBuilder.Entity<Cinema>(entity =>
            {
                entity.ToTable("cinema");

                entity.Property(e => e.CinemaId).HasColumnName("cinemaId");

                entity.Property(e => e.CinemaNo).HasColumnName("cinemaNo");

                entity.Property(e => e.MovieId).HasColumnName("movieId");

                entity.HasOne(d => d.Movie)
                    .WithMany(p => p.Cinemas)
                    .HasForeignKey(d => d.MovieId)
                    .HasConstraintName("FK__cinema__movieId__38996AB5");
            });

            modelBuilder.Entity<Feedback>(entity =>
            {
                entity.ToTable("feedback");

                entity.Property(e => e.FeedbackId).HasColumnName("feedbackId");

                entity.Property(e => e.FeedbackContent)
                    .HasMaxLength(300)
                    .IsUnicode(false)
                    .HasColumnName("feedbackContent");

                entity.Property(e => e.FeedbackDate)
                    .HasColumnType("datetime")
                    .HasColumnName("feedbackDate");

                entity.Property(e => e.FeedbackSubject)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("feedbackSubject");

                entity.Property(e => e.UserEmail)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("userEmail");
            });

            modelBuilder.Entity<Movie>(entity =>
            {
                entity.ToTable("movie");

                entity.Property(e => e.MovieId).HasColumnName("movieId");

                entity.Property(e => e.Cast)
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("cast");

                entity.Property(e => e.CinemaId).HasColumnName("cinemaId");

                entity.Property(e => e.Description)
                    .HasColumnType("text")
                    .HasColumnName("description");

                entity.Property(e => e.Director)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("director");

                entity.Property(e => e.Duration).HasColumnName("duration");

                entity.Property(e => e.ImageName)
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("imageName");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.Title)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.Property(e => e.Trailer)
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("trailer");

                entity.HasOne(d => d.Cinema)
                    .WithMany(p => p.Movies)
                    .HasForeignKey(d => d.CinemaId)
                    .HasConstraintName("FK__movie__cinemaId__3F466844");
            });

            modelBuilder.Entity<Plot>(entity =>
            {
                entity.ToTable("plots");

                entity.Property(e => e.PlotId).HasColumnName("plotId");

                entity.Property(e => e.Floor).HasColumnName("floor");

                entity.Property(e => e.IsEmpty).HasColumnName("isEmpty");

                entity.Property(e => e.PlotName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("plotName");

                entity.Property(e => e.StoreId).HasColumnName("storeId");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Plots)
                    .HasForeignKey(d => d.StoreId)
                    .HasConstraintName("FK__plots__storeId__2F10007B");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.ToTable("products");

                entity.Property(e => e.ProductId).HasColumnName("productId");

                entity.Property(e => e.BrandId).HasColumnName("brandId");

                entity.Property(e => e.Category)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("category");

                entity.Property(e => e.ImageName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("imageName");

                entity.Property(e => e.ProductName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("productName");

                entity.Property(e => e.StoreId).HasColumnName("storeId");

                entity.HasOne(d => d.Brand)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.BrandId)
                    .HasConstraintName("FK__products__brandI__300424B4");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.StoreId)
                    .HasConstraintName("FK__products__storeI__30F848ED");
            });

            modelBuilder.Entity<Seat>(entity =>
            {
                entity.ToTable("seat");

                entity.Property(e => e.SeatId).HasColumnName("seatId");

                entity.Property(e => e.SeatNo).HasColumnName("seatNo");
            });

            modelBuilder.Entity<Seatreserve>(entity =>
            {
                entity.ToTable("seatreserve");

                entity.Property(e => e.SeatreserveId).HasColumnName("seatreserveId");

                entity.Property(e => e.CinemaId).HasColumnName("cinemaId");

                entity.Property(e => e.SeatId).HasColumnName("seatId");

                entity.Property(e => e.SeatreserveCode).HasColumnName("seatreserveCode");

                entity.Property(e => e.SeatreserveDate)
                    .HasColumnType("date")
                    .HasColumnName("seatreserveDate");

                entity.Property(e => e.SeatreserveName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("seatreserveName");

                entity.Property(e => e.Showtime).HasColumnName("showtime");

                entity.HasOne(d => d.Cinema)
                    .WithMany(p => p.Seatreserves)
                    .HasForeignKey(d => d.CinemaId)
                    .HasConstraintName("FK__seatreser__cinem__3D5E1FD2");

                entity.HasOne(d => d.Seat)
                    .WithMany(p => p.Seatreserves)
                    .HasForeignKey(d => d.SeatId)
                    .HasConstraintName("FK__seatreser__seatI__3E52440B");
            });

            modelBuilder.Entity<Store>(entity =>
            {
                entity.ToTable("stores");

                entity.Property(e => e.StoreId).HasColumnName("storeId");

                entity.Property(e => e.CloseTime).HasColumnName("closeTime");

                entity.Property(e => e.ImageName)
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("imageName");

                entity.Property(e => e.OpenTime).HasColumnName("openTime");

                entity.Property(e => e.PlotId).HasColumnName("plotId");

                entity.Property(e => e.PromoImageName)
                    .HasMaxLength(256)
                    .IsUnicode(false)
                    .HasColumnName("promoImageName");

                entity.Property(e => e.StoreAbout)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("storeAbout");

                entity.Property(e => e.StoreCategory)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("storeCategory");

                entity.Property(e => e.StoreDescription)
                    .HasColumnType("text")
                    .HasColumnName("storeDescription");

                entity.Property(e => e.StoreName)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("storeName");

                entity.HasOne(d => d.Plot)
                    .WithMany(p => p.Stores)
                    .HasForeignKey(d => d.PlotId)
                    .HasConstraintName("FK__stores__plotId__31EC6D26");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
