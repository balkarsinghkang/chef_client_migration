# 1) List of all nodes.
# -migrate current active and failed nodes.
# manually copy data from automate into a file
filename="first.txt"
oldchefconfigpath="/c/Users/Veritasadmin/.chef/config.rb"
newchefconfigpath="/c/Users/Veritasadmin/chef-repo/.chef/config.rb"
migrationdirectory="/d/migration"
while IFS= read -r node
do
    if test -f "$migrationdirectory/$node.json"; then 
    echo "Node $node already migrated, skipping now."
    else
        echo "Processing $node"
        # 2) Export json for all nodes.
        echo "Downloading $node configuration from curent chef server"
        knife node show $node -F json -c $oldchefconfigpath > $migrationdirectory/$node.json
        # 3) Import json files.
        echo "Staging $node configuration on new chef server"
        # knife node list -c $newchefconfigpath 
        knife node from file $migrationdirectory/$node.json -c $newchefconfigpath 
        # knife node list -c $newchefconfigpath
        # knife node show $node -c $newchefconfigpath 
        
        # 4) Assign migration policy to the nodes.
        knife node policy set $node migration lbg_chef_client_migration
    fi
done < $filename





