name 'chef_client_migration'
maintainer 'Contact'
maintainer_email 'contact@customer.com'
license 'All Rights Reserved'
description 'Installs/Configures chef_client_migration'
version '0.1.0'
chef_version '>= 12.0'

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/chef_client_migration/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/chef_client_migration'
source_url       'https://gitlab.customer.com/chef/cookbooks/chef-client'

depends 'chef-client'
