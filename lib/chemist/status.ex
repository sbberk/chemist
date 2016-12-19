defmodule Chemist.Status do

  @moduledoc """
  Retrieve league data from Riot API
  and transform it into an Elixir friendly format
  """
    
  import Chemist.Util

  @api_version_status             Application.get_env(:chemist, :api_version_status)

  def shards() do
    url_shards
    |> HTTPoison.get
    |> handle_response
  end
    
  def shard(region) do
    if valid_region?(region) do
      region
      |> url_shard
      |> HTTPoison.get
      |> handle_response
    else
      {:error, "invalid request"}
    end
  end
    
  defp url_shards() do
    base_url_status
    <> "/shards?"
    <> url_key()
  end

  defp url_shard(region) do
    base_url_status
    <> "/shards/#{region}?"
    <> url_key()
  end

end