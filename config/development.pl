{
  secrets => ['31bf2acdcc872ede7eced19d611661a8cc5c51ad'],
  DBI => [
    "dbi:mysql:database=app_development;host=$ENV{DATABASE_HOST};port=$ENV{DATABASE_PORT}",
    $ENV{DATABASE_USER},
    $ENV{DATABASE_PASSWORD}
  ]
}