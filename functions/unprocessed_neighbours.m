function neighbours = unprocessed_neighbours(img,processed_pixels,i,j,neighbours_array)

    neighbours = [];

   if not(isempty(neighbours_array))

    if not(any(processed_pixels == sub2ind(size(img),i-1,j))) && (not(any(neighbours_array(:,1) == i-1)) || not(any(neighbours_array(:,2) == j)) )
        neighbours = [neighbours;i-1 j];
    end

    if not(any(processed_pixels == sub2ind(size(img),i+1,j))) && (not(any(neighbours_array(:,1) == i+1)) || not(any(neighbours_array(:,2) == j)) )
        neighbours = [neighbours;i+1 j];
    end

    if not(any(processed_pixels == sub2ind(size(img),i,j-1))) && (not(any(neighbours_array(:,1) == i)) || not(any(neighbours_array(:,2) == j-1)) )
        neighbours = [neighbours;i j-1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i,j+1))) && (not(any(neighbours_array(:,1) == i)) || not(any(neighbours_array(:,2) == j+1)) )
        neighbours = [neighbours;i j+1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i-1,j-1))) && (not(any(neighbours_array(:,1) == i-1)) || not(any(neighbours_array(:,2) == j-1)) )
        neighbours = [neighbours;i-1 j-1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i-1,j+1))) && (not(any(neighbours_array(:,1) == i-1)) || not(any(neighbours_array(:,2) == j+1)) )
        neighbours = [neighbours;i-1 j+1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i+1,j-1))) && (not(any(neighbours_array(:,1) == i+1)) || not(any(neighbours_array(:,2) == j-1)) )
        neighbours = [neighbours;i+1 j-1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i+1,j+1))) && (not(any(neighbours_array(:,1) == i+1)) || not(any(neighbours_array(:,2) == j+1)) )
        neighbours = [neighbours;i+1 j+1];
    end




   else






    if not(any(processed_pixels == sub2ind(size(img),i-1,j)))
        neighbours = [neighbours;i-1 j];
    end

    if not(any(processed_pixels == sub2ind(size(img),i+1,j))) 
        neighbours = [neighbours;i+1 j];
    end

    if not(any(processed_pixels == sub2ind(size(img),i,j-1)))
        neighbours = [neighbours;i j-1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i,j+1))) 
        neighbours = [neighbours;i j+1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i-1,j-1))) 
        neighbours = [neighbours;i-1 j-1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i-1,j+1))) 
        neighbours = [neighbours;i-1 j+1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i+1,j-1)))
        neighbours = [neighbours;i+1 j-1];
    end

    if not(any(processed_pixels == sub2ind(size(img),i+1,j+1))) 
        neighbours = [neighbours;i+1 j+1];
    end






       
   end