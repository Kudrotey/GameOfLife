class GameOfLife
    def get_next_grid(current_grid)

        new_grid = current_grid.map.with_index do |row, row_index|
      
            row.map.with_index do |cell, column_index|
      
              living_neighbours_count = number_of_living_neighbours(row_index, column_index, current_grid)
             
             new_state_of_cell(cell, living_neighbours_count)
              
            end
          end
          
    end

    def new_state_of_cell(cell, living_neighbours_count)
        # if dead
        if cell == :dead && living_neighbours_count == 3
            return :live
        elsif cell == :live && living_neighbours_count == 3
            return :live
  
        # if live
        elsif cell == :live && living_neighbours_count < 2
            return :dead
        elsif cell == :live && living_neighbours_count > 3
            return :dead
        else
            return cell
        end 
    end

    def number_of_living_neighbours(cell_row_index, cell_column_index, grid)
    
        current_count = 0
    
        # left
        if grid[cell_row_index][cell_column_index-1] == :live
          current_count += 1
        end
            
          # right
        if grid[cell_row_index][cell_column_index+1] == :live
          current_count += 1
        end
    
          # above
        if grid[cell_row_index-1][cell_column_index] == :live
          current_count += 1
        end
    
          # below
        if grid[cell_row_index+1] != nil && grid[cell_row_index+1][cell_column_index] == :live
          current_count += 1 
        end
    
          #top left
        if grid[cell_row_index-1][cell_column_index-1] == :live
          current_count += 1
        end
    
          #top right
        if grid[cell_row_index-1][cell_column_index+1] == :live
          current_count += 1
        end
    
        #bottom left
        if grid[cell_row_index+1] != nil && grid[cell_row_index+1][cell_column_index-1] == :live
          current_count += 1
        end
        
        #bottom right
        if grid[cell_row_index+1] != nil && grid[cell_row_index+1][cell_column_index+1] == :live
          current_count += 1
        end
        current_count
    end
end