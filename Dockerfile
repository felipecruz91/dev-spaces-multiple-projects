FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /src
COPY "dev-spaces-multiple-projects.sln" "dev-spaces-multiple-projects.sln"
COPY ["mywebapi.Common/mywebapi.Common.csproj", "mywebapi.Common/mywebapi.Common.csproj"]
COPY ["mywebapi/mywebapi.csproj", "mywebapi/mywebapi.csproj"]

RUN dotnet restore "dev-spaces-multiple-projects.sln"

COPY . .
WORKDIR /src/mywebapi
RUN dotnet build "mywebapi.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "mywebapi.csproj" --no-restore -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "mywebapi.dll"]