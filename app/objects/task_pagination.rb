class TaskPagination
  attr_reader :tasks, :page, :pages, :limit, :count

  def initialize(tasks:, page:, pages:, limit:, count:)
    @tasks = tasks
    @page = page
    @pages = pages
    @limit = limit
    @count = count
  end
end
