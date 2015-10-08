defmodule GCloudStorage.Client do
  use HTTPoison.Base
  @base_url "https://www.googleapis.com/storage/v1/b"

  def process_url(url) do
    @base_url <> url |> IO.inspect
  end

  defp process_request_headers(headers) do
    token = GCloudStorage.TokenCache.access_token
    Enum.into(headers, [
          {"Authorization", "Bearer #{token}"}
        ]
    )
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end