EMAIL_PATTERN = /([A-Za-z_\-]*\.?\w*)\@(\w*\.\w{3})/

def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided
  groups = email.match(EMAIL_PATTERN)
  if groups.nil?
    raise ArgumentError.new, "#{email} is not a valid email"
  else
    clean_name = groups[1].tr('.', ' ')
    p clean_name
    return compute_joke(clean_name, groups[2])
  end
end

def compute_joke(name, domain)
  case domain
  when 'lewagon.org'
    return "Well done #{name}, you're skilled and capable"
  when 'gmail.com'
    return "#{name}, you're an average but modern person"
  when 'live.com'
    return "#{name}, weren't you born after 1973?"
  else
    return "Sorry #{name}, we don't know how to judge '#{domain}'"
  end
end

p mail_joke "boris@lewagon.org"
p mail_joke "boris@gmail.com"
p mail_joke "jean-marc.alarue@live.com"
p mail_joke "voyageurdufutur@milkyway.gal"
