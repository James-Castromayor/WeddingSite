# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project file and restore dependencies
COPY ["Wedding.csproj", "./"]
RUN dotnet restore "Wedding.csproj"

# Copy everything else and build
COPY . .
RUN dotnet build "Wedding.csproj" -c Release -o /app/build

# Publish stage
FROM build AS publish
RUN dotnet publish "Wedding.csproj" -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Copy published app
COPY --from=publish /app/publish .

# Set entry point
ENTRYPOINT ["dotnet", "Wedding.dll"]
