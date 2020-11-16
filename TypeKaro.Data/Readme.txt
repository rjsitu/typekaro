Start Application :- dotnet run

For Firsttime Setup:-

dotnet ef dbcontext scaffold "Server=.\SQLEXPRESS;Database=TypeKaro;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -o Entity --context-dir "Context" -c "TypeKaroDBContext"

For DB Update:-

dotnet ef dbcontext scaffold "Server=.\SQLEXPRESS;Database=TypeKaro;Trusted_Connection=True;" Microsoft.EntityFrameworkCore.SqlServer -o Entity --context-dir "Context" -c "TypeKaroDBContext" --force