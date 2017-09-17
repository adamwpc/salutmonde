FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore SalutMonde/SalutMonde.csproj

# copy everything else and build
RUN dotnet publish -c Release -o out SalutMonde/SalutMonde.csproj

# build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /app
# For 2.0 
COPY --from=build-env /app/SalutMonde/out .
ENTRYPOINT ["dotnet", "SalutMonde.dll"]
