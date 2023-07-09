FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build-env
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore

#Build
COPY . ./
RUN dotnet publish -c Release -o out

#Build runtime
FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "PlayStudios.MyService.WebApi.dll"]
