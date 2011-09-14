module EntriesHelper
  def format_string_length(message, max_length)
    if(message.length > max_length)
      return CGI.escapeHTML(message[0, max_length]+".....")
    else
      return CGI.escapeHTML(message)
    end
  end
  def is_public(flag)
    if flag == 1
      return "public"
    elsif flag == 2
      return "future"
    else
      return "draft"
    end
  end
end

