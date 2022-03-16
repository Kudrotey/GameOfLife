require_relative '../game_of_life.rb'

describe 'GameOfLife' do
    it 'when given a 2x2 square of live cells of a 4x4 grid, no change will occur' do
        current_grid = [
                        [ :dead, :dead, :dead, :dead ],
                        [ :dead, :live, :live, :dead ],
                        [ :dead, :live, :live, :dead ],
                        [ :dead, :dead, :dead, :dead ]
                       ]

        game_of_life = GameOfLife.new
        next_grid = game_of_life.get_next_grid(current_grid)

        expect(next_grid).to eq(current_grid)
    end

    context 'in a 5x5 grid' do
        context 'given a vertical line of 3 live cells' do
            it 'will change to a horizontal line of 3 live cells' do
                current_grid = [
                                [ :dead, :dead, :dead, :dead, :dead ],
                                [ :dead, :dead, :live, :dead, :dead ],
                                [ :dead, :dead, :live, :dead, :dead ],
                                [ :dead, :dead, :live, :dead, :dead ],
                                [ :dead, :dead, :dead, :dead, :dead ]
                               ]

                new_grid = [
                                [ :dead, :dead, :dead, :dead, :dead ],
                                [ :dead, :dead, :dead, :dead, :dead ],
                                [ :dead, :live, :live, :live, :dead ],
                                [ :dead, :dead, :dead, :dead, :dead ],
                                [ :dead, :dead, :dead, :dead, :dead ]
                            ]
                
                game_of_life = GameOfLife.new
                next_grid = game_of_life.get_next_grid(current_grid)

                expect(next_grid).to eq(new_grid)
            end
        end
    end
end