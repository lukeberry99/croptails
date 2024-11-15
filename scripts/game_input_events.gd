class_name GameInputEvents

static var direction: Vector2

static func movement_input() -> Vector2:
	if Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO
	
	return direction

static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	return true

static func use_tool() -> bool:
	return Input.is_action_just_pressed('hit')

static func tool_input() -> void:
	
	if Input.is_action_just_pressed('tool_1'):
		ToolManager.select_tool_via_input(DataTypes.Tools.AxeWood)
	if Input.is_action_just_pressed('tool_2'):
		ToolManager.select_tool_via_input(DataTypes.Tools.TillGround)
	if Input.is_action_just_pressed('tool_3'):
		ToolManager.select_tool_via_input(DataTypes.Tools.WaterCrops)
	if Input.is_action_just_pressed('tool_4'):
		ToolManager.select_tool_via_input(DataTypes.Tools.PlantCorn)
	if Input.is_action_just_pressed('tool_5'):
		ToolManager.select_tool_via_input(DataTypes.Tools.PlantTomato)
