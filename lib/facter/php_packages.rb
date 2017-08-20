Facter.add(:php_packages) do
  confine :osfamily => 'RedHat'
  setcode do
    phps = Facter::Core::Execution.exec('rpm -qa|grep -e "^php-[0-9]\|^php[0-9][0-9]-php-[0-9]\|^rh-php[0-9][0-9]-php-[0-9]"').split.sort
    packages_hash = {}
    phps.each do |php|
      if /^php-[0-9]/.match(php)
        # stock php
        release = 'php'
        base_version = php.split('-')[1]
        backport = php.split('-')[2].split('.')[0]
      elsif /^php[0-9][0-9]-php-[0-9]/.match(php)
        # CentOS or softwarecollections.org pacakge
        release = php.split('-')[0]
        base_version = php.split('-')[2]
        backport = php.split('-')[3].split('.')[0]
        software_collection = release
      elsif /^rh-php[0-9][0-9]-php-[0-9]/.match(php)
        # Red Hat software collection
        release = php.split('-')[1]
        base_version = php.split('-')[3]
        backport = php.split('-')[4].split('.')[0]
        software_collection = "rh-#{release}"
      end

      if base_version
        major = base_version.split('.')[0]
        minor = base_version.split('.')[1]
        revision = base_version.split('.')[2]
        full_version = "#{base_version}-#{backport}"
        os = php.split('.')[-2]
        arch = php.split('.')[-1]
      end

      packages_hash[release] = {
        :full_version => full_version,
        :base_version => base_version,
        :major => major,
        :minor => minor,
        :revsion => revision,
        :backport => backport,
        :os => os,
        :arch => arch,
        :package => php
      }

      if software_collection
        packages_hash[release][:software_collection] = software_collection
      end
    end
    packages_hash
  end
end
