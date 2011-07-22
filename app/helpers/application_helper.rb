module ApplicationHelper

  def redcloth content
    raw RedCloth.new(content).to_html
  end
end
