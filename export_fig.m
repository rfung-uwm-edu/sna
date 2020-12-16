function export_fig(filetype_flag,resolution_flag,filename)
  
  if (nargin==2)
    filename = resolution_flag;
    resolution_flag = filetype_flag;
  end
  filetype_flag = '-djpeg';
  where_dot = strfind(filename,'.');
  filename = filename(1:where_dot(end)-1);
  command = ['print ' filetype_flag ' ' resolution_flag ' ' filename '.jpg'];
  eval(command)
  
