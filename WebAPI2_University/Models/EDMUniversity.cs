namespace WebAPI2_University.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class EDMUniversity : DbContext
    {
        public EDMUniversity()
            : base("name=EDMUniversity")
        {
            this.Configuration.LazyLoadingEnabled = false;
            this.Configuration.ProxyCreationEnabled = false;
        }

        public virtual DbSet<student> students { get; set; }
        public virtual DbSet<subject> subjects { get; set; }
        public virtual DbSet<subject_registration> subject_registrations { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<student>()
                .Property(e => e.first_name)
                .IsUnicode(false);

            modelBuilder.Entity<student>()
                .Property(e => e.last_name)
                .IsUnicode(false);

            modelBuilder.Entity<student>()
                .HasMany(e => e.subject_registrations)
                .WithRequired(e => e.students)
                .HasForeignKey(e => e.student_id);

            modelBuilder.Entity<subject>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<subject>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<subject>()
                .HasMany(e => e.subject_registrations)
                .WithRequired(e => e.subjects)
                .HasForeignKey(e => e.subject_id);
        }
    }
}
