Facter.add(:php_releases) do
    setcode do
      scl_releases = (`rpm -qa rh-php*-php | rev | cut -f4 -d"-" | rev`).strip
      upstream_release = (`rpm -qa php | rev | cut -f2 -d"-" | rev |cut -f-2,1 -d"."`).strip
      if !scl_releases.empty? and !upstream_release.empty?
        releases = "php\n#{scl_releases}"
      elsif !scl_releases.empty?
        releases = "#{scl_releases}"
      elsif !upstream_release.empty?
        releases = "#{upstream_release}"
      else
        releases = "unknown"
      end
    releases.split("\n")
    end
  end
  
  Facter.add(:php_versions, :type => :aggregate) do
    confine :kernel => 'Linux'
    chunk(:full) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      major    = (`echo \"#{package}\" | rev | cut -f5 -d'.' | cut -f1 -d'-' | rev`).strip
      minor    = (`echo \"#{package}\" | rev | cut -f4 -d'.' | cut -f2 -d'-' | rev`).strip
      revision = (`echo \"#{package}\" | rev | cut -f3 -d'.' | cut -f2 -d'-' | rev`).strip
      backport = (`echo \"#{package}\" | rev | cut -f3 -d'.' | cut -f1 -d'-' | rev`).strip
      version_hash[release] = {:full    => "#{major}.#{minor}.#{revision}-#{backport}"}
    end
    version_hash
    end
  
    chunk(:major) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      major = (`echo \"#{package}\" | rev | cut -f5 -d'.' | cut -f1 -d'-' | rev`).strip
      version_hash[release] = {:major => major}
    end
    version_hash
    end
  
    chunk(:minor) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      minor = (`echo \"#{package}\" | rev | cut -f4 -d'.' | cut -f2 -d'-' | rev`).strip
      version_hash[release] = {:minor => minor}
    end
    version_hash
    end
  
    chunk(:revision) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      revision = (`echo \"#{package}\" | rev | cut -f3 -d'.' | cut -f2 -d'-' | rev`).strip
      version_hash[release] = {:revision => revision}
    end
    version_hash
    end
  
    chunk(:backport) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      backport = (`echo \"#{package}\" | rev | cut -f3 -d'.' | cut -f1 -d'-' | rev`).strip
      version_hash[release] = {:backport => backport}
    end
    version_hash
    end
  
    chunk(:os) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      os = (`echo \"#{package}\" | rev | cut -f2 -d"." | rev`).strip
      version_hash[release] = {:os => os}
    end
    version_hash
    end
  
    chunk(:arch) do
    version_hash = {}
    Facter.value(:php_releases).each do |release|
      if release == "php"
        package = (`rpm -q php`)
      else
        package = (`rpm -q rh-#{release}-php`)
      end
      arch = (`echo \"#{package}\" | rev | cut -f1 -d"." | rev`).strip
      version_hash[release] = {:arch => arch}
    end
    version_hash
    end
  end