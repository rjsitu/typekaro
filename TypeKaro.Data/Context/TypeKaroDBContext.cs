using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using TypeKaro.Data.Entity;

namespace TypeKaro.Data.Context
{
    public partial class TypeKaroDBContext : DbContext
    {
        public TypeKaroDBContext()
        {
        }

        public TypeKaroDBContext(DbContextOptions<TypeKaroDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AccessLevel> AccessLevel { get; set; }
        public virtual DbSet<GroupType> GroupType { get; set; }
        public virtual DbSet<UserBase> UserBase { get; set; }
        public virtual DbSet<UserGroup> UserGroup { get; set; }
        public virtual DbSet<UserPost> UserPost { get; set; }
        public virtual DbSet<UserProfile> UserProfile { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=localhost;Database=TypeKaro;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<AccessLevel>(entity =>
            {
                entity.HasKey(e => e.AccessId);

                entity.Property(e => e.AccessId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.AccessRemark)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.AccessTo)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<GroupType>(entity =>
            {
                entity.Property(e => e.GroupTypeId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.GroupRemark)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.GroupTypeName)
                    .IsRequired()
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.IsPost).HasDefaultValueSql("((0))");

                entity.Property(e => e.IsPrivate).HasDefaultValueSql("((1))");

                entity.Property(e => e.ModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");
            });

            modelBuilder.Entity<UserBase>(entity =>
            {
                entity.HasKey(e => e.UserId)
                    .HasName("PK_LoginKaro");

                entity.Property(e => e.UserId).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.LastLoginDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.UserContact)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UserDisplayName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UserEmailId)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.UserPassword).HasMaxLength(50);

                entity.Property(e => e.UserSource)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<UserGroup>(entity =>
            {
                entity.HasKey(e => e.GroupId)
                    .HasName("PK_GroupBnao");

                entity.Property(e => e.GroupId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.CreatedBy).HasDefaultValueSql("(newid())");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.GroupName)
                    .IsRequired()
                    .HasMaxLength(300);

                entity.Property(e => e.GroupTag).HasMaxLength(200);

                entity.Property(e => e.GroupTypeId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.ModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");
            });

            modelBuilder.Entity<UserPost>(entity =>
            {
                entity.HasKey(e => e.PostId)
                    .HasName("PK_PostKaro");

                entity.Property(e => e.PostId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.IsActive)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.ModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.PostHeader).HasMaxLength(200);

                entity.Property(e => e.PostMessage).IsRequired();
            });

            modelBuilder.Entity<UserProfile>(entity =>
            {
                entity.HasKey(e => e.ProfileId);

                entity.Property(e => e.ProfileId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.ModifiedDate)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getutcdate())");

                entity.Property(e => e.UserImage)
                    .IsRequired()
                    .HasColumnType("image");
            });
        }
    }
}
