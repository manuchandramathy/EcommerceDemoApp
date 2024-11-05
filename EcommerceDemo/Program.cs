using Ecommerce.BusinessLogic;
using Ecommerce.DataAccess;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();



// Register the connection string as a singleton
builder.Services.AddSingleton(builder.Configuration.GetConnectionString("DefaultConnection"));


// Register the OrderRepository and inject the connection string
builder.Services.AddScoped<OrderRepository, OrderRepository>(provider =>
{
    var connectionString = provider.GetRequiredService<string>();
    return new OrderRepository(connectionString);
});

// Registering OrderService as a Singleton
builder.Services.AddTransient<OrderService, OrderService>();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
