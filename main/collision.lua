local COL = {}

function COL.resolve_contact_point(message, correction, go)
	if message.distance > 0 then
		local proj = vmath.project(correction, message.normal * message.distance)
		if proj < 1 then
			local comp = (message.distance - message.distance * proj) * message.normal
			go.set_position(go.get_position() + comp)
			correction = correction + comp
		end
	end
	return correction
end

return COL