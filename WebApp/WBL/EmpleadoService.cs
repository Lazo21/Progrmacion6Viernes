using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BD;
using Entity;

namespace WBL
{
    public interface IEmpleadoService
    {
        Task<BDEntity> Create(EmpleadoEntity entity);
        Task<BDEntity> Delete(EmpleadoEntity entity);
        Task<IEnumerable<EmpleadoEntity>> Get();
        Task<EmpleadoEntity> GetById(EmpleadoEntity entity);
        Task<BDEntity> Update(EmpleadoEntity entity);
    }

    public class EmpleadoService : IEmpleadoService
    {
        private readonly IDataAccess sql;
        public EmpleadoService(IDataAccess _sql)
        {
            sql = _sql;
        }


        #region MetodosCrud

        //Metodo Get

        public async Task<IEnumerable<EmpleadoEntity>> Get()
        {
            try
            {
                var result = sql.QueryAsync<EmpleadoEntity>("exp.EmpleadoObtener");

                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        //Metodo GetById
        public async Task<EmpleadoEntity> GetById(EmpleadoEntity entity)
        {
            try
            {
                var result = sql.QueryFirstAsync<EmpleadoEntity>("exp.EmpleadoObtener", new
                { entity.IdEmpleado });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        //Metodo Create

        public async Task<BDEntity> Create(EmpleadoEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("exp.EmpleadoInsertar", new
                {
                    entity.Identificacion,
                    entity.Nombre,
                    entity.PrimerApellido,
                    entity.SegundoApellido,
                    entity.Edad,
                    entity.FechaNacimiento



                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        //Metodo Update
        public async Task<BDEntity> Update(EmpleadoEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("exp.EmpleadoActualizar", new
                {
                    entity.IdEmpleado,
                    entity.Identificacion,
                    entity.Nombre,
                    entity.PrimerApellido,
                    entity.SegundoApellido,
                    entity.Edad,
                    entity.FechaNacimiento


                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        //Metodo Delete
        public async Task<BDEntity> Delete(EmpleadoEntity entity)
        {
            try
            {
                var result = sql.ExecuteAsync("exp.EmpleadoEliminar", new
                {
                    entity.IdEmpleado,



                });

                return await result;
            }
            catch (Exception)
            {

                throw;
            }

        }


        #endregion

    }


}
