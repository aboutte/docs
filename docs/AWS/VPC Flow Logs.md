# Install awslogs
    
    pip install awslogs


# Capture

    awslogs get aws_vpc_log_groups ALL --start='12/05/2017 17:00' --end='12/05/2017 20:00' > vpcflowlog


# Remove first two columns

    cat vpcflowlog | awk '{print $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 " " $12 " " $13 " " $14 " " $15 " " $16}' > tmp



# Get rows that are inter VPC communication and drop intra VPC communication

    cat tmp | awk '{ if( $4 ~ /10\.100/ && $5 ~ /10\.100/ ) {} else { print } }' > vpcflowlog
