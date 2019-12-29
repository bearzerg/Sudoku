//
//  Render.swift
//  SudokuKit
//
//  Created by Eneko Alonso on 12/22/19.
//

import SwiftyTextTable
import Rainbow

extension SudokuPuzzle {
    public func values(empty: String = ".") -> [[String]] {
        return matrix.allRows.map { row in
            return row.map { $0 ?? empty }
        }
    }

    public func renderSimple(separator: String = "", empty: String = ".") -> String {
        return values(empty: empty)
            .map { $0.joined(separator: separator) }
            .joined(separator: "\n")
    }

    public func renderTable(empty: String = ".") -> String {
        var table = TextTable(columns: (1...columns).map { _ in TextTableColumn(header: "") })
        table.addRows(values: values(empty: empty))
        return table.render()
    }
}

extension SudokuSolution {
    public func values(highlight index: Int?, color: Color) -> [[String]] {
        let values = matrix.cells.enumerated().map { tuple -> String in
            let (cellIndex, cell) = tuple
            let value = cell.joined()
            guard let index = index else {
                return value.applyingColor(value.count > 1 ? Color.lightBlack : Color.white)
            }
            if cellIndex == index {
                return value.applyingColor(color)
            }
            if cellIndex % matrix.columns == index % matrix.columns || cellIndex / matrix.columns == index / matrix.columns {
                return value.cyan
            }
            return value.applyingColor(value.count > 1 ? Color.lightBlack : Color.white)
        }
        return values.split(inGroupsOf: matrix.columns).map(Array.init)
    }

    public func renderTable(highlight index: Int? = nil, color: Color = .green) -> String {
        var table = TextTable(columns: (1...matrix.columns).map { _ in TextTableColumn(header: "") })
        table.addRows(values: values(highlight: index, color: color))
        return table.render()
    }
}
