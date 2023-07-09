FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore

#Build
COPY . ./
RUN dotnet publish -c Release -o out

#Build runtime
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "PlayStudios.MyService.Webapi.dll"]
