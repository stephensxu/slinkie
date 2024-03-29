class Link < ActiveRecord::Base
  before_create :set_short_name, :prepend_http_if_not_present

  validates :url, :presence => true
  validates :nickname, :presence => true
  # validates :private, :presence => true, inclusion: { in: [true, false] }

  belongs_to :user
  has_many :clicks, :class_name => "LinkClick"

  # This controls how an ActiveRecord object is displayed in a URL context.
  # This way, if we do link_path(@link), Rails will generate a path like
  # "/l/#{@link.short_name}" vs. "/l/#{@link.id}".
  # See: http://apidock.com/rails/ActiveRecord/Integration/to_param
  def to_param
    self.short_name
  end

  def clicked!(click_attributes = {})
    self.clicks.create(click_attributes)
  end

  def clicks_count
    self.clicks.count
  end

  def change_privacy
    self.private ? self.private = false : self.private = true
    self.save
  end

  def editable_by?(user)
    user.present? && self.user == user
  end

  private
  def set_short_name
    # Generate and assign a random short_name unless one has already been set.
    return self.short_name if self.short_name.present?

    # See: http://www.ruby-doc.org/stdlib-2.1.2/libdoc/securerandom/rdoc/SecureRandom.html#method-c-urlsafe_base64
    # We do this to ensure we're not creating two links with the same short_name
    # Since it's randomly generated and not user-supplied, we can't rely on
    # validations to do this for us.
    try_short_name = SecureRandom.urlsafe_base64(6)
    while Link.where(:short_name => try_short_name).any?
      try_short_name = SecureRandom.urlsafe_base64(6)
    end

    self.short_name = try_short_name
  end

  def prepend_http_if_not_present
    unless self.url[/\Ahttp(s):\/\//]
      self.url = "http://#{self.url}"
    end
  end
end
