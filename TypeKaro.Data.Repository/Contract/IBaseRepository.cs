using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace TypeKaro.Data.Repository.Contract
{
    public interface IBaseRepository<T> where T : class
    {        
        T Add(T entity);
        void Update(T entity);
        void Delete(T entity);
        T Get(int id);
        T Get(Guid id);
        IEnumerable<T> GetAll(params Expression<Func<T, object>>[] includes);
        IEnumerable<T> Filter(Expression<Func<T, bool>> where, params Expression<Func<T, object>>[] includes);
        int SaveChanges();
    }
}
