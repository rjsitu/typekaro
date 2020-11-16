using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using TypeKaro.Data.Context;
using TypeKaro.Data.Repository.Contract;

namespace TypeKaro.Data.Repository
{
    public class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        internal TypeKaroDBContext _context;
        public BaseRepository(TypeKaroDBContext context)
        {
            this._context = context;
        }
        public virtual T Add(T entity)
        {
            _context.Set<T>().Add(entity);
            _context.SaveChanges();
            return entity;

        }

        public virtual void Update(T entity)
        {
            _context.Entry(entity).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public virtual void Delete(T entity)
        {
            _context.Remove(entity);
            _context.SaveChanges();
        }

        public T Get(int id) => _context.Set<T>().FindAsync(id).Result;

        public T Get(Guid id) => _context.Set<T>().FindAsync(id).Result;

        public IEnumerable<T> GetAll(params Expression<Func<T, object>>[] includes)
        {
            IQueryable<T> query = _context.Set<T>().AsQueryable();
            foreach (Expression<Func<T, object>> i in includes)
            {
                query = query.Include(i);
            }
            return query.ToList();
        }

        public IEnumerable<T> Filter(Expression<Func<T, bool>> predicate, params Expression<Func<T, object>>[] includes)
        {
            var query = _context.Set<T>().Where(predicate);
            foreach (Expression<Func<T, object>> i in includes)
            {
                query = query.Include(i);
            }
            return query.ToList();
        }

        public int SaveChanges() => _context.SaveChanges();
    }
}
