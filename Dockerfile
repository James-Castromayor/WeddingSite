FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project file
COPY ["WeddingSite/WeddingSite.csproj", "WeddingSite/"]

# Restore dependencies
RUN dotnet restore "WeddingSite/WeddingSite.csproj"

# Copy everything
COPY . .

# Build and publish
WORKDIR "/src/WeddingSite"
RUN dotnet publish -c Release -o /app/publish

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "WeddingSite.dll"]
