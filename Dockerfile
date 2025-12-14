# Build with .NET 9.0
FROM mcr.microsoft.com/dotnet/sdk:9.0-alpine AS build
WORKDIR /src

# Copy everything
COPY . .

# Restore, build, publish
RUN dotnet restore "WeddingSite/WeddingSite.csproj"
RUN dotnet build "WeddingSite/WeddingSite.csproj" -c Release -o /app/build
RUN dotnet publish "WeddingSite/WeddingSite.csproj" -c Release -o /app/publish

# Runtime with .NET 9.0
FROM mcr.microsoft.com/dotnet/aspnet:9.0-alpine AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "WeddingSite.dll"]
