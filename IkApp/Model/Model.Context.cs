﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IkApp.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BibEntities : DbContext
    {
        private static BibEntities _context;


        public BibEntities()
            : base("name=BibEntities")
        {
        }

        public static BibEntities GetContext()
        {
            if (_context == null)
                _context = new BibEntities();
            return _context;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<InventarnoyKnigi> InventarnoyKnigi { get; set; }
        public virtual DbSet<Journal> Journal { get; set; }
        public virtual DbSet<Kniga> Kniga { get; set; }
        public virtual DbSet<Publication> Publication { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<Type> Type { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}
