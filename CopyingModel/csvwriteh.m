function csvwriteh( filename, data, header )

if exist( 'filename', 'var' )
    if ~ischar( filename )
        error('filename not char')
    end
else
    error('filename does not exists')
end

if exist( 'data', 'var' )
    if ~isnumeric( data )
        error('data not numeric')
    end
else
    error('data does not exist')
end

if exist( 'header', 'var' )
    if ~iscellstr( header )
        error('header no cell str')
    end
else
    error('header does not exist')
end

[drow dcol] = size (data);
[hrow hcol] = size (header);
if hcol ~= dcol
    error( 'header not of same length as data (columns)' )
end

outid = fopen (filename, 'w+');


for idx = 1:hcol
    fprintf (outid, '%s', header{idx});
    if idx ~= hcol
        fprintf (outid, ',');
    else
        fprintf (outid, '\n' );
    end
end
fclose(outid);

dlmwrite (filename, data, '-append' );