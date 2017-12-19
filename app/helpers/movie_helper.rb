module MovieHelper
  def rating_active?(view)
    if view == "ByViews"
      return "active"
    else
    end
  end

  def view_active?(view)
    if view == "ByRating"
      return "active"
    else
    end
  end
end
