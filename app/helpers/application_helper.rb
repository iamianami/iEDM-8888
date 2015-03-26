module ApplicationHelper
  def fix_url(str)
    str.starts_with?("https://") ? str : "https://#{str}"
  end
end
