defmodule KV.Bucket do
  use Agent
  @moduledoc """
  Key Value store
  """

  @doc """
  Starts a new bucket
  """
  def start_link(_opt) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Returns the value associated with key for the bucket
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Assigns the value to the key in the bucket
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes the key from the bucket
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
