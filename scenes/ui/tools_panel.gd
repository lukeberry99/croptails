extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_watering: Button = $MarginContainer/HBoxContainer/ToolWatering
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling

func _ready() -> void:
	ToolManager.tool_deselected.connect(on_tool_deselected)
	ToolManager.tool_selected_via_input.connect(on_tool_selected_via_input)

func on_tool_deselected() -> void:
	print('deslecting all tools')
	tool_axe.release_focus()
	tool_watering.release_focus()
	tool_tilling.release_focus()
	tool_corn.release_focus()
	tool_tomato.release_focus()

func on_tool_selected_via_input(tool: DataTypes.Tools) -> void:
	print('Selecting', tool)
	if tool == DataTypes.Tools.AxeWood:
		tool_axe.grab_focus()
	if tool == DataTypes.Tools.WaterCrops:
		tool_watering.grab_focus()
	if tool == DataTypes.Tools.TillGround:
		tool_tilling.grab_focus()
	if tool == DataTypes.Tools.PlantCorn:
		tool_corn.grab_focus()
	if tool == DataTypes.Tools.PlantTomato:
		tool_tomato.grab_focus()
