class ApplicationController < ActionController::API

  private

  def current_page
    (params[:page] || 1).to_i
  end
  
  def per_page
    (params[:per_page] || 20).to_i
  end

  def total_pages
    @resource.total_pages || 0
  end

  def collection_size
    @resource.count || 0
  end

  def pagination_options
    opts = {
      total: collection_size,
      total_pages: total_pages,
      page: current_page,
      per_page: per_page
    }

    @pagination_options ||= { is_collection: true, meta: opts, links: links }
  end

  def links
    next_page = (current_page < total_pages) ? generate_url(current_page + 1) : nil
    previous_page = (current_page > 1) ? generate_url(current_page - 1) : nil

    {
      prev: previous_page,
      self: request.original_url,
      next: next_page,
    }
  end

  def generate_url(page)
    base = request.original_url.split('?').first

    custom_params = request.params.except("action", "controller")

    custom_params["page"] = page

    "#{base}?#{custom_params.to_query}"
  end
end
