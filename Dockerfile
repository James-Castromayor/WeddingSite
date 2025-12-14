#11 0.822   Determining projects to restore...
#11 0.833 /usr/share/dotnet/sdk/8.0.416/Sdks/Microsoft.NET.Sdk/targets/Microsoft.NET.TargetFrameworkInference.targets(166,5): error NETSDK1045: The current .NET SDK does not support targeting .NET 9.0.  Either target .NET 8.0 or lower, or use a version of the .NET SDK that supports .NET 9.0. Download the .NET SDK from https://aka.ms/dotnet/download [/src/WeddingSite/WeddingSite.csproj]
#11 ERROR: process "/bin/sh -c dotnet restore \"WeddingSite/WeddingSite.csproj\"" did not complete successfully: exit code: 1
------
 > [build 4/7] RUN dotnet restore "WeddingSite/WeddingSite.csproj":
0.822   Determining projects to restore...
0.833 /usr/share/dotnet/sdk/8.0.416/Sdks/Microsoft.NET.Sdk/targets/Microsoft.NET.TargetFrameworkInference.targets(166,5): error NETSDK1045: The current .NET SDK does not support targeting .NET 9.0.  Either target .NET 8.0 or lower, or use a version of the .NET SDK that supports .NET 9.0. Download the .NET SDK from https://aka.ms/dotnet/download [/src/WeddingSite/WeddingSite.csproj]
------
Dockerfile:8
--------------------
   6 |     
   7 |     # Restore dependencies
   8 | >>> RUN dotnet restore "WeddingSite/WeddingSite.csproj"
   9 |     
  10 |     # Copy everything
--------------------
error: failed to solve: process "/bin/sh -c dotnet restore \"WeddingSite/WeddingSite.csproj\"" did not complete successfully: exit code: 1
