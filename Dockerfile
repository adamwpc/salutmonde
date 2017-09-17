FROM microsoft/dotnet:2.0-sdk
WORKDIR /app

COPY . ./
RUN dotnet restore SalutMonde/SalutMonde.csproj

RUN dotnet publish -c Release -o out SalutMonde/SalutMonde.csproj
ENTRYPOINT ["dotnet", "SalutMonde/out/SalutMonde.dll"]
