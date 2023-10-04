function segmented_digits = extract(img)

    img = padarray(img,[10 10],0,'both'); % We add padding to take the edges into consideration

    I = img(:);

    segmented_digits = {};

    processed_pixels = [];

    for i = 2:size(img,1)-1                 %We go over each pixel
        for j = 2:size(img,2)-1

            if not(any(processed_pixels == sub2ind(size(img),i,j)))  %If it is not processed, we process it
                
                   if img(i,j) == 0
                       processed_pixels = [processed_pixels sub2ind(size(img),i,j)]; %If it is black, we don't do anything and just mark it as processed
                   end


                   if img(i,j) == 1 % if it is white, we mark it as proccessed and process its neighbours

                        coords = [i j];
                        processed_pixels = [processed_pixels sub2ind(size(img),i,j)];
                        neighbours = [];
                        neighbours = unprocessed_neighbours(img,processed_pixels,i,j,neighbours);

                        while not(isempty(neighbours)) 
                            p = neighbours(1,1);
                            q = neighbours(1,2);

                                 if img(p,q) == 0
                                     processed_pixels = [processed_pixels sub2ind(size(img),p,q)];
                                     neighbours = neighbours(2:end,:);
                                 end

                                 if img(p,q) == 1
                                     coords = [coords;p q];
                                     processed_pixels = [processed_pixels sub2ind(size(img),p,q)];
                                     neighbours = neighbours(2:end,:);
                                     neighbours = [neighbours;unprocessed_neighbours(img,processed_pixels,p,q,neighbours)]; 
                                 end
                        end

                        segmented_digits{end+1} = coords; %We add the final cluster to the segmented_digit array

                   end
            end
        end
    end

       