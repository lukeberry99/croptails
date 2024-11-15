extends Node

var selected_tool: DataTypes.Tools = DataTypes.Tools.None

signal tool_selected(tool: DataTypes.Tools)
signal tool_deselected()
signal tool_selected_via_input(tool: DataTypes.Tools)

func select_tool(tool: DataTypes.Tools) -> void:
	tool_selected.emit(tool)
	selected_tool = tool

func toggle_tool(tool: DataTypes.Tools) -> void:
	if ToolManager.selected_tool != tool:
		ToolManager.select_tool(tool)
	else:
		deselect_tool()

func deselect_tool() -> void:
	ToolManager.select_tool(DataTypes.Tools.None)
	tool_deselected.emit()

func select_tool_via_input(tool: DataTypes.Tools) -> void:
	if(selected_tool != tool):
		tool_selected_via_input.emit(tool)
	ToolManager.toggle_tool(tool)
	
	
