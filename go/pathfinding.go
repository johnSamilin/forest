package main

import (
	"syscall/js"

	astar "./lib/nickdavies"
)

var width int
var height int
var a astar.AStar
var p2p astar.AStarConfig

func setGrid(frst js.Value, args []js.Value) interface{} {
	width = args[0].Int()
	height = args[1].Int()
	a = astar.NewAStar(width, height)
	p2p = astar.NewPointToPoint()

	return frst
}

func setObstacles(frst js.Value, args []js.Value) interface{} {
	for i := 0; i < len(args); i += 2 {
		a.FillTile(astar.Point{args[i].Int(), args[i+1].Int()}, -1)
	}
	return frst
}

func findPath(frst js.Value, args []js.Value) interface{} {
	fromX := args[0].Int()
	fromY := args[1].Int()
	toX := args[2].Int()
	toY := args[3].Int()
	source := []astar.Point{astar.Point{fromX, fromY}}
	target := []astar.Point{astar.Point{toX, toY}}

	path := a.FindPath(p2p, source, target)
	j := 0
	outGrid := make([]interface{}, 0)
	for path != nil {
		outGrid = append(outGrid, path.Col)
		outGrid = append(outGrid, path.Row)
		path = path.Parent
		j += 2
	}

	return outGrid
}

func registerCallbacks() {
	js.Global().Set("setGrid", js.FuncOf(setGrid))
	js.Global().Set("setObstacles", js.FuncOf(setObstacles))
	js.Global().Set("findPath", js.FuncOf(findPath))
}

func main() {
	c := make(chan bool)
	registerCallbacks()

	<-c
}
