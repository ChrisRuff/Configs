function update_path --on-event fish_preexec
	pwd > /tmp/whereami
end
