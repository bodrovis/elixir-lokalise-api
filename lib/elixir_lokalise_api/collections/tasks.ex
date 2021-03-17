defmodule ElixirLokaliseApi.Collection.Tasks do
  defstruct items: [],
            project_id: nil,
            branch: nil,
            total_count: nil,
            page_count: nil,
            per_page_limit: nil,
            current_page: nil
end