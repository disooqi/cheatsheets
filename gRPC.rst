Tutorial to write protobuf3:

- https://protobuf.dev/reference/python/python-generated/

You can find gRPC Python examples in the following link: 

- https://github.com/grpc/grpc/tree/master/examples/python


.. code-block:: bash

   # To generate Python files for A2 project
   pipenv run python -m grpc_tools.protoc -I /home/disooqi/projects/A2-DataAccess/protobufs --python_out=./src/app/pb2/  --grpc_python_out=./src/app/pb2/ user.proto newswire.proto article.proto subscription.proto


Checkout the quick reference for reStructureText_ and reStructuredText-Documentation-Reference_.

.. _reStructureText: https://docutils.sourceforge.io/docs/user/rst/quickref.html
.. _reStructuredText-Documentation-Reference: https://github.com/DevDungeon/reStructuredText-Documentation-Reference

