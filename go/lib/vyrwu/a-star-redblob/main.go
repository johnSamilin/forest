package main

import (
	"syscall/js"
)

func findPath(a js.Value, args []js.Value) interface{} {
	width := args[0].Int()
	height := args[1].Int()
	topology := args[2]
	start := []js.Value(args[3])
	goal := args[4]
	callback := args[5]

	walls := []Location{}
	forests := []Location{}

	grid := SquareGrid{
		width:   width,
		height:  height,
		walls:   walls,
		forests: forests,
	}

	startLoc := Location{start[1], start[1]}
	goalLoc := Location{goal[0], goal[1]}
	path := aStarSearch(grid, startLoc, goalLoc)

	callback.Invoke(path)

	return a
}

func registerCallbacks() {
	js.Global().Set("findPath", js.FuncOf(findPath))
}

func main() {
	c := make(chan bool)
	registerCallbacks()

	// now draw a map based on grid and shortest path found by A*
	// for y := 0; y < maxY; y++ {
	// 	for x := 0; x < maxX; x++ {
	// 		l := Location{
	// 			x,
	// 			y,
	// 		}
	// 		if l.y == start.y && l.x == start.x {
	// 			fmt.Print(" S ")
	// 		} else if l.y == goal.y && l.x == goal.x {
	// 			fmt.Print(" G ")
	// 		} else if contains(grid.walls, l) {
	// 			fmt.Print(" X ")
	// 		} else if contains(grid.forests, l) {
	// 			fmt.Print(" ^ ")
	// 		} else if contains(path, l) {
	// 			fmt.Print(" * ")
	// 		} else {
	// 			fmt.Print(" . ")
	// 		}
	// 	}
	// 	fmt.Println()
	// }
	<-c
}
